class Kmgr::OverviewsController < ApplicationController
  before_filter :authenticate_user!

  layout "mailer", only: [:test]

  def index
    @all_signups = Signup.all.order(:clname)

    @outstanding = @all_signups.select do |signup|
      signup.amt_due > 0 || signup.payment.nil? || signup.payment.accepted != '1'
    end

    @accepted = @all_signups.select do |signup|
      !signup.payment.nil? && signup.payment.accepted == "1"
    end

    outer = Hash.new

    outer['Kindergarten'] = { grade: 'Kindergarten', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer['1st Grade'] = { grade: '1st Grade', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer['2nd Grade'] = { grade: '2nd Grade', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer['3rd Grade'] = { grade: '3rd Grade', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer['4th Grade'] = { grade: '4th Grade', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer['5th Grade'] = { grade: '5th Grade', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }
    outer[:total] = { grade: 'Total', s1: 0, s2: 0, s3: 0, s4: 0, s5: 0, total: 0 }

    @accepted.each do |signup|
      outer[signup.cage][:s1] = outer[signup.cage][:s1] + (signup.session1 == "1" ? 1 : 0)
      outer[signup.cage][:s2] = outer[signup.cage][:s2] + (signup.session2 == "1" ? 1 : 0)
      outer[signup.cage][:s3] = outer[signup.cage][:s3] + (signup.session3 == "1" ? 1 : 0)
      outer[signup.cage][:s4] = outer[signup.cage][:s4] + (signup.session4 == "1" ? 1 : 0)
      outer[signup.cage][:s5] = outer[signup.cage][:s5] + (signup.session5 == "1" ? 1 : 0)
      outer[signup.cage][:total] = outer[signup.cage][:s1] +outer[signup.cage][:s2] +outer[signup.cage][:s3] +outer[signup.cage][:s4] +outer[signup.cage][:s5]

      outer[:total][:s1] = outer['Kindergarten'][:s1] +outer['1st Grade'][:s1] +outer['2nd Grade'][:s1] +outer['3rd Grade'][:s1] +outer['4th Grade'][:s1] +outer['5th Grade'][:s1]
      outer[:total][:s2] = outer['Kindergarten'][:s2] +outer['1st Grade'][:s2] +outer['2nd Grade'][:s2] +outer['3rd Grade'][:s2] +outer['4th Grade'][:s2] +outer['5th Grade'][:s2]
      outer[:total][:s3] = outer['Kindergarten'][:s3] +outer['1st Grade'][:s3] +outer['2nd Grade'][:s3] +outer['3rd Grade'][:s3] +outer['4th Grade'][:s3] +outer['5th Grade'][:s3]
      outer[:total][:s4] = outer['Kindergarten'][:s4] +outer['1st Grade'][:s4] +outer['2nd Grade'][:s4] +outer['3rd Grade'][:s4] +outer['4th Grade'][:s4] +outer['5th Grade'][:s4]
      outer[:total][:s5] = outer['Kindergarten'][:s5] +outer['1st Grade'][:s5] +outer['2nd Grade'][:s5] +outer['3rd Grade'][:s5] +outer['4th Grade'][:s5] +outer['5th Grade'][:s5]
      outer[:total][:total] = outer['Kindergarten'][:total] +outer['1st Grade'][:total] +outer['2nd Grade'][:total] +outer['3rd Grade'][:total] +outer['4th Grade'][:total] +outer['5th Grade'][:total]
    end



    @summeries = []
    @summeries.push(outer['Kindergarten'])
    @summeries.push(outer['1st Grade'])
    @summeries.push(outer['2nd Grade'])
    @summeries.push(outer['3rd Grade'])
    @summeries.push(outer['4th Grade'])
    @summeries.push(outer['5th Grade'])
    @summeries.push(outer[:total])

  end

  def test
    render :action => "../../notification_mailer/fsa"
  end

end