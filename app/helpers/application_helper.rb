module ApplicationHelper

  def groupings_plaintext(cohort, grouping_id)
    plaintext = ''
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
    markdown = ''
    cohort.groupings.select(:group_id).where(grouping_id: grouping_id).group(:group_id).count.size.times do |grp|

      markdown << "**Group #{grp + 1}:**\n"

      cohort.groupings.where(grouping_id: grouping_id, group_id: grp).each do |g|

        markdown << "- #{g.student.name}\n"

      end

      markdown << "\n"

    end
    markdown
  end

end
