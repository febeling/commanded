use Mix.Config

# Print only warnings and errors during test
config :logger, :console, level: :warn, format: "[$level] $message\n"

config :ex_unit,
  capture_log: true,
  assert_receive_timeout: 200

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.InMemory,
  type_provider: Commanded.Serialization.ModuleNameTypeProvider,
  reset_storage: fn ->
    {:ok, _event_store} = Commanded.EventStore.Adapters.InMemory.start_link()
  end
