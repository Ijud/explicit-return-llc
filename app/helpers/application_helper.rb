module ApplicationHelper

  def groupings_plaintext(cohort, grouping_id)
    plaintext = "#{cohort.name}\n\n"
    cohort.groupings.select(:group_id).where(grouping_id: grouping_id).group(:group_id).count.size.times do |grp|

      plaintext << "Group #{grp + 1}:\n"

      cohort.groupings.where(grouping_id: grouping_id, group_id: grp).each do |g|

        plaintext << "#{g.student.name}\n"

      end

      plaintext << "\n"

    end
    plaintext
  end

  def groupings_markdown(cohort, grouping_id)
    markdown = "# #{cohort.name}\n\n"
    markdown << "Group | Name\n"
    markdown << ":---: | :---:\n"
    cohort.groupings.select(:group_id).where(grouping_id: grouping_id).group(:group_id).count.size.times do |grp|

      cohort.groupings.where(grouping_id: grouping_id, group_id: grp).each do |g|

        markdown << "#{grp + 1} | #{g.student.name}\n"

      end
    end
    markdown
  end

end
