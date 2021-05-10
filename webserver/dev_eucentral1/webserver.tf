module "dev_webserver" {
  source = "../modules/webserver"

  instance_type = var.instance_type

  service_name = var.service_name
  service_environment = var.service_environment
}

module "webserver_alarms" {
  source = "../modules/alarms"
  depends_on = [module.dev_webserver]

  email_to_notify = var.email_to_notify

  service_name = var.service_name
  service_environment = var.service_environment
}
