run_app:
	@echo "Running app from .env file enviroment"
	@fvm flutter run --dart-define-from-file=.env

config_json_server:
	@echo "Launching Server API"
	@json-server --watch database_mock/database.json