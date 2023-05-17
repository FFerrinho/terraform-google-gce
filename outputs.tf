output "instance_name" {
  description = "The name of the created instance."
  value       = google_compute_instance.main.name
}

output "instance_network_interface" {
  description = "The network interface configuration of the created instance."
  value       = google_compute_instance.main.network_interface
}

output "instance_boot_disk" {
  description = "The boot disk configuration of the created instance."
  value       = google_compute_instance.main.boot_disk
}

output "instance_attached_disks" {
  description = "The attached disks configuration of the created instance."
  value       = google_compute_instance.main.attached_disk
}

output "instance_service_account" {
  description = "The service account configuration of the created instance."
  value       = google_compute_instance.main.service_account
}
