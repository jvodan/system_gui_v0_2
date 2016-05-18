class System
  class Activity

    def core_system
      @core_system ||= System.instance.core_system
    end

    def memory_data
      @memory_data ||= core_system.memory_statistics
    end

    def cpu_data
      @cpus_data ||= core_system.cpus_usage
    end

    def disk_data
      @disk_data ||= core_system.disks_usage
    end

    def network_data
      @network_data ||= core_system.network_interfaces_usage
    end

    def engines_memory
      @engines_memory ||=
        memory_data[:containers][:applications].
        map do |engine_name, data|
          memory = data[:limit]/1048576
          memory = 0 if memory < 0
          [ "#{engine_name} #{memory} MB", memory ]
        end.
        sort_by { |engine_name, memory| memory }.to_h
    end

    def services_memory
      @services_memory ||=
        memory_data[:containers][:services].
        map do |service_name, data|
          memory = data[:limit]/1048576
          memory = 0 if memory < 0
          [ "#{service_name} #{memory} MB", memory ]
        end.
        sort_by { |service_name, memory| memory }.to_h
    end

    def containers_memory
      @containers_memory ||=
      ( containers = memory_data[:containers][:totals]
        applications = containers[:applications][:allocated].to_i/1048576
        services = containers[:services][:allocated].to_i/1048576
        { "Engines #{applications} MB" => applications,
          "Services #{services} MB" => services } )
    end

    def unaccounted_memory
      @unaccounted_memory ||= ( memory_data[:system][:total].to_i -
                                memory_data[:system][:active].to_i -
                                memory_data[:system][:buffers].to_i -
                                memory_data[:system][:file_cache].to_i -
                                memory_data[:system][:free].to_i )/1024
    end

    def system_memory
      @system_memory ||= {
        "Active #{memory_data[:system][:active].to_i/1024} MB" =>
          memory_data[:system][:active].to_i/1024,
        "Buffers #{memory_data[:system][:buffers].to_i/1024} MB" =>
          memory_data[:system][:buffers].to_i/1024,
        "File cache #{memory_data[:system][:file_cache].to_i/1024} MB" =>
          memory_data[:system][:file_cache].to_i/1024,
        "Free #{memory_data[:system][:free].to_i/1024} MB" =>
          memory_data[:system][:free].to_i/1024,
        }.merge( if unaccounted_memory > 0
            {"Other #{unaccounted_memory} MB" => unaccounted_memory}
          else; {}; end )
    end

    def cpu_load
      @cpu_load ||= (
        cpus_lookup = {}
        cpu_data.cpus.each do |cpu|
          cpus_lookup[cpu.num] =
            { user: cpu.user,
              system: cpu.system,
              nice: cpu.nice,
              idle: cpu.idle }
        end
        [
          { name: 'User', data: cpus_lookup.map{|num, cpu| ["CPU #{num}", cpu[:user] ] } },
          { name: 'System', data: cpus_lookup.map{|num, cpu| ["CPU #{num}", cpu[:system] ] } },
          { name: 'Nice', data: cpus_lookup.map{|num, cpu| ["CPU #{num}", cpu[:nice] ] } },
          { name: 'Idle', data: cpus_lookup.map{|num, cpu| ["CPU #{num}", cpu[:idle] ] } },
        ] )
    end

    def cpu_queue
      @cpu_queue ||=
        { "One min #{cpu_data.load_average.one_minute}" =>
            [cpu_data.load_average.one_minute],
           "Five mins #{cpu_data.load_average.five_minutes}" =>
            [cpu_data.load_average.five_minutes] ,
           "Fifteen mins #{cpu_data.load_average.fifteen_minutes}" =>
            [cpu_data.load_average.fifteen_minutes] }
    end

    def disks
      @disks ||=
      [ { name: 'Free', data: disk_space_lookup.map{|label, space| [ label, space[:free] ] } },
        { name: 'Used', data: disk_space_lookup.map{|label, space| [ label, space[:used] ] } } ]
    end

    def disk_space_lookup
      @disk_space_lookup ||=
        {}.tap do |result|
          disk_data.each do |disk|
            disk_size = disk.total_blocks.to_f / 2097152
            disk_free = disk.available_blocks.to_f / 2097152
            disk_label = "#{disk.type} #{disk.mount} #{disk_size} GB"
            result[disk_label] = { free: disk_free,
                                  used: disk_size - disk_free }
          end
        end
    end

    def network
      @network ||=
      [ { name: 'In', data: network_activity_lookup.map{|label, network| [ label, network[:in] ] } },
        { name: 'Out', data: network_activity_lookup.map{|label, network| [ label, network[:out] ] } } ]
    end

    def network_activity_lookup
      @network_activity_lookup ||=
        {}.tap do |result|
          network_data.each do |network|
            result[network.name] = { in: network.in_bytes,
                                     out: network.out_bytes }
          end
        end
    end

  end
end
