module SummaryMgr
  extend ActiveSupport::Concern

  module ClassMethods
    def overview
      all_signups = Signup.all.order(:clname)
      accepted = all_signups.select do |signup|
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

      accepted.each do |signup|
        outer[signup.cage][:s1] = outer[signup.cage][:s1] + (signup.session1 == "1" ? 1 : 0)
        outer[signup.cage][:s2] = outer[signup.cage][:s2] + (signup.session2 == "1" ? 1 : 0)
        outer[signup.cage][:s3] = outer[signup.cage][:s3] + (signup.session3 == "1" ? 1 : 0)
        outer[signup.cage][:s4] = outer[signup.cage][:s4] + (signup.session4 == "1" ? 1 : 0)
        outer[signup.cage][:s5] = outer[signup.cage][:s5] + (signup.session5 == "1" ? 1 : 0)
        outer[signup.cage][:total] = outer[signup.cage][:s1] + outer[signup.cage][:s2] + outer[signup.cage][:s3] + outer[signup.cage][:s4] + outer[signup.cage][:s5]

        outer[:total][:s1] = outer['Kindergarten'][:s1] + outer['1st Grade'][:s1] + outer['2nd Grade'][:s1] + outer['3rd Grade'][:s1] + outer['4th Grade'][:s1] + outer['5th Grade'][:s1]
        outer[:total][:s2] = outer['Kindergarten'][:s2] + outer['1st Grade'][:s2] + outer['2nd Grade'][:s2] + outer['3rd Grade'][:s2] + outer['4th Grade'][:s2] + outer['5th Grade'][:s2]
        outer[:total][:s3] = outer['Kindergarten'][:s3] + outer['1st Grade'][:s3] + outer['2nd Grade'][:s3] + outer['3rd Grade'][:s3] + outer['4th Grade'][:s3] + outer['5th Grade'][:s3]
        outer[:total][:s4] = outer['Kindergarten'][:s4] + outer['1st Grade'][:s4] + outer['2nd Grade'][:s4] + outer['3rd Grade'][:s4] + outer['4th Grade'][:s4] + outer['5th Grade'][:s4]
        outer[:total][:s5] = outer['Kindergarten'][:s5] + outer['1st Grade'][:s5] + outer['2nd Grade'][:s5] + outer['3rd Grade'][:s5] + outer['4th Grade'][:s5] + outer['5th Grade'][:s5]
        outer[:total][:total] = outer['Kindergarten'][:total] + outer['1st Grade'][:total] + outer['2nd Grade'][:total] + outer['3rd Grade'][:total] + outer['4th Grade'][:total] + outer['5th Grade'][:total]
      end

      summeries = []
      summeries.push(outer['Kindergarten'])
      summeries.push(outer['1st Grade'])
      summeries.push(outer['2nd Grade'])
      summeries.push(outer['3rd Grade'])
      summeries.push(outer['4th Grade'])
      summeries.push(outer['5th Grade'])
      summeries.push(outer[:total])
    end

    def summaries
      summeries = Signup.overview

      classk = summeries.select { |s| s[:grade] == 'Kindergarten' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      class1 = summeries.select { |s| s[:grade] == '1st Grade' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      class2 = summeries.select { |s| s[:grade] == '2nd Grade' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      class3 = summeries.select { |s| s[:grade] == '3rd Grade' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      class4 = summeries.select { |s| s[:grade] == '4th Grade' || s[:grade] == '5th Grade' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      total = summeries.select { |s| s[:grade] == 'Total' }
                        .map { |s| { s1: s[:s1], s2: s[:s2], s3: s[:s3], s4: s[:s4], s5: s[:s5] } }
                        .reduce { |s, n| { s1: (s[:s1] + n[:s1]), s2: (s[:s2] + n[:s2]), s3: (s[:s3] + n[:s3]), s4: (s[:s4] + n[:s4]), s5: (s[:s5] + n[:s5]) } }

      { classk: classk, class1: class1, class2: class2, class3: class3, class4: class4, total: total }
    end

  end
end