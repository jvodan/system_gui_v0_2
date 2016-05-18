module Reports
  module ReportsHelper

    def report_collapse_data(label, data)
      id = "report_#{label.underscore.gsub(' ' , '_')}_collapse"
      content_tag(:a, label, class: 'btn btn-lg', type: 'button', data: {toggle:'collapse', target: "##{id}"}) +
      content_tag(:p) do
        content_tag(:div, pretty_print(data), class: 'collapse', id: id)
      end
    end

    def report_ps_container_table(data)
      content_tag(:label, 'Container ps') +
      content_tag(:p) do
        if data
          content_tag(:div, class: 'table-responsive') do
            content_tag :table, class: 'table' do
              content_tag(:tr) do
                data['Titles'].map do |title|
                  content_tag :th, title
                end.join.html_safe
              end +
              data['Processes'].map do |process|
                content_tag :tr do
                  process.map do |datum|
                    content_tag :td, datum
                  end.join.html_safe
                end
              end.join.html_safe
            end
          end
        else
          'Engine must be running to view container ps.'
        end
      end
    end

    def report_network_metrics(network_metrics)
      content_tag(:label, 'Network metrics') +
      content_tag(:p) do
        data_list_text('In', network_metrics[:in]) +
        data_list_text('Out', network_metrics[:out])
      end
    end

    def report_memory_statistics(memory_statistics)
      content_tag(:label, 'Memory statistics') +
      content_tag(:p) do
        data_list_text('Maximum', memory_statistics[:in]) +
        data_list_text('Current', memory_statistics[:out]) +
        data_list_text('Limit', memory_statistics[:limit])
      end
    end

  end
end
