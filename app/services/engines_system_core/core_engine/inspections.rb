module EnginesSystemCore
  class CoreEngine
    module Inspections

      {
        state:                  :read_state,
        active?:                :is_active?,
        is_running?:            :is_running?,
        reinstall_required?:    :rebuild_required?,
        restart_required?:      :restart_required?,
        is_error?:              :is_error?,
        has_container?:         :has_container?,
        container_type:         :ctype,
        host_name:              :hostname,
        http_protocol:          :http_protocol,
        # http_protocol_as_sym:   :protocol,
        # https_only?:            :https_only,
        domain_name:            :domain_name,
        web_sites:              [:web_sites, []],
        default_startup_state:  :setState,
        memory:                 :memory,
        # monitored:              :monitored,
        framework:              :framework,
        runtime:                :runtime,
        image:                  :image,
        repository:             :repository,
        web_port:                   :web_port,
        external_ports:         [:eports, []],
        last_error:             :last_error,
        last_result:            :last_result,
        stats:                  [:stats, {}],
        ps_container:           :ps_container,
        logs_container:         :logs_container,
        environments:           [:environments, []],
        volumes:           [:volumes, {}],
        # consumers_hash:         :consumers,
        deployment_type:        :deployment_type
      }.
      each do |method, system_method_with_default|
        if system_method_with_default.is_a? Array
          system_method = system_method_with_default.first
          default = system_method_with_default.last
        else
          system_method = system_method_with_default
          default = nil
        end
        define_method(method) do
          CoreResult::Result.new(:get, engine_api.send(system_method), default).call # if api
        end
      end

    end
  end
end
