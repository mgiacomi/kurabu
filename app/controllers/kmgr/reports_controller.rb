require 'googleauth'
require 'google/apis/sheets_v4'
require 'google/apis/drive_v3'

class Kmgr::ReportsController < ApplicationController
  before_action :authenticate_user!
  APPLICATION_NAME = 'Kurabu'

  def index
    @summeries = Signup.overview
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def list
    @signups = Signup.all.order(:clname).select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    render action: "../forms/index"
  end

  def signuplist
    if params[:id] == "1"
      session = "session1"
    elsif params[:id] == "2"
      session = "session2"
    elsif params[:id] == "3"
      session = "session3"
    elsif params[:id] == "4"
      session = "session4"
    elsif params[:id] == "5"
      session = "session5"
    end

    accepted = Signup.where("#{session}=?", "1").order(:clname).select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    @kinder = Set.new
    @first = Set.new
    @second = Set.new
    @third = Set.new
    @forth = Set.new
    @fifth = Set.new

    accepted.each do |signup|
      if signup.cage == 'Kindergarten'
        @kinder.add(signup)
      end
      if signup.cage == '1st Grade'
        @first.add(signup)
      end
      if signup.cage == '2nd Grade'
        @second.add(signup)
      end
      if signup.cage == '3rd Grade'
        @third.add(signup)
      end
      if signup.cage == '4th Grade'
        @forth.add(signup)
      end
      if signup.cage == '5th Grade'
        @fifth.add(signup)
      end
    end
  end

  def emaillist
    if params[:id] == "1"
      session = "session1"
    elsif params[:id] == "2"
      session = "session2"
    elsif params[:id] == "3"
      session = "session3"
    elsif params[:id] == "4"
      session = "session4"
    elsif params[:id] == "5"
      session = "session5"
    end

    accepted = Signup.where("#{session}=?", "1").select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    @kinder = Set.new
    @first = Set.new
    @second = Set.new
    @third = Set.new
    @forth = Set.new
    @fifth = Set.new

    accepted.each do |signup|
      if signup.cage == 'Kindergarten'
        @kinder.add(signup.email)
      end
      if signup.cage == '1st Grade'
        @first.add(signup.email)
      end
      if signup.cage == '2nd Grade'
        @second.add(signup.email)
      end
      if signup.cage == '3rd Grade'
        @third.add(signup.email)
      end
      if signup.cage == '4th Grade'
        @forth.add(signup.email)
      end
      if signup.cage == '5th Grade'
        @fifth.add(signup.email)
      end
    end
  end

  def signupsheet
    # Service authentication to Google
    scopes = [Google::Apis::SheetsV4::AUTH_SPREADSHEETS, Google::Apis::SheetsV4::AUTH_DRIVE]
    authorization = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: StringIO.new(ENV['KURABU_KEY']), scope: scopes)

    # Initialize Sheets API
    s_service = Google::Apis::SheetsV4::SheetsService.new
    s_service.client_options.application_name = APPLICATION_NAME
    s_service.authorization = authorization

    # Initialize Drive API
    d_service = Google::Apis::DriveV3::DriveService.new
    d_service.client_options.application_name = APPLICATION_NAME
    d_service.authorization = authorization

    # Initialize Drive API
    d_service = Google::Apis::DriveV3::DriveService.new
    d_service.client_options.application_name = APPLICATION_NAME
    d_service.authorization = authorization

    # copy existing sheet - returns Google::Apis::DriveV3::File
    file = d_service.copy_file '1Xrqvr6pKnw-GZFUJMnDUpWsequkViVvgkuY27mzTsPo'

    # open sheet
    ss = s_service.get_spreadsheet file.id

    # update header
    value_range = Google::Apis::SheetsV4::ValueRange.new
    value_range.range = "D1:E1"
    value_range.major_dimension = 'ROWS'
    value_range.values = [["Session #{params[:session]}", params[:grade]]]
    s_service.update_spreadsheet_value ss.spreadsheet_id, value_range.range, value_range, value_input_option: 'USER_ENTERED'

    # update weeks
    if params[:session] == "1"
      daysOfWeek = [['Mon 6/22', 'Tue 6/23', 'Wed 6/24', 'Thu 6/25', 'Fri 6/26']]
      session = "session1"
    elsif params[:session] == "2"
      daysOfWeek = [['Mon 6/29', 'Tue 6/30', 'Wed 7/1', 'Thu 7/2']]
      session = "session2"
    elsif params[:session] == "3"
      daysOfWeek = [['Mon 7/6', 'Tue 7/7', 'Wed 7/8', 'Thu 7/9', '7/10']]
      session = "session3"
    elsif params[:session] == "4"
      daysOfWeek = [['Mon 7/13', 'Tue 7/14', 'Wed 7/15', 'Thu 7/16', 'Fri 7/17']]
      session = "session4"
    elsif params[:session] == "5"
      daysOfWeek = [['Mon 7/20', 'Tue 7/21', 'Wed 7/22', 'Thu 7/23', 'Fri 7/24']]
      session = "session5"
    end

    value_range = Google::Apis::SheetsV4::ValueRange.new
    value_range.range = "G3:K3"
    value_range.major_dimension = 'ROWS'
    value_range.values = daysOfWeek
    s_service.update_spreadsheet_value ss.spreadsheet_id, value_range.range, value_range, value_input_option: 'USER_ENTERED'

    # SQL Injection can happen here if session is not manually assigned in this controller.
    @accepted = Signup.where("#{session}=? and cage=?", "1", params[:grade]).order(:clname).select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    # create a data matrix
    count = 1
    rows = Array.new
    @accepted.each do |signup, index|
      summary = "#{signup.p1fname} #{signup.p1lname}\n#{signup.phone1}\n#{signup.p2fname} #{signup.p2lname}\n#{signup.phone2}"
      rows << [count, signup.clname, signup.cfname, summary, signup.medical]
      count += 1
    end

    # update data
    value_range = Google::Apis::SheetsV4::ValueRange.new
    value_range.range = "A4:E#{rows.length + 3}"
    puts "range: #{value_range.range}"
    value_range.major_dimension = 'ROWS'
    value_range.values = rows
    s_service.update_spreadsheet_value ss.spreadsheet_id, value_range.range, value_range, value_input_option: 'USER_ENTERED'

    #delete unused rows
    range = Google::Apis::SheetsV4::DimensionRange.new
    range.sheet_id = ss.sheets[0].properties.sheet_id
    range.dimension = 'ROWS'
    range.start_index = rows.length + 3
    range.end_index = 200
    d_request = Google::Apis::SheetsV4::DeleteDimensionRequest.new
    d_request.range = range
    request = Google::Apis::SheetsV4::Request.new
    request.delete_dimension = d_request
    batch_update = Google::Apis::SheetsV4::BatchUpdateSpreadsheetRequest.new
    batch_update.requests = [request]
    s_service.batch_update_spreadsheet ss.spreadsheet_id, batch_update

    file_path = "reports/#{SecureRandom.hex(20)}.xlsx"
    d_service.export_file ss.spreadsheet_id, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', download_dest: file_path
    send_file file_path, disposition: 'attachment', filename: "kurabu_session#{params[:session]}_#{params[:grade].downcase.tr(' ', '_')}.xlsx"
  end

  def dump_report
    @signups = Signup.all.order(:clname).select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end
    headers['Content-Disposition'] = "attachment; filename=\"kurabu_signups.csv\""
    headers['Content-Type'] ||= 'text/csv'
  end

end