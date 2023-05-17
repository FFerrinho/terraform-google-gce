variable "machine_type" {
  description = "The machine type for the instance."
}

variable "name" {
  description = "The name of the instance."
}

variable "zone" {
  description = "The zone where the instance will be created."
}

variable "allow_stopping_for_update" {
  description = "Whether the instance can be stopped for updating."
}

variable "can_ip_forward" {
  description = "Whether the instance is allowed to forward traffic."
}

variable "description" {
  description = "The description of the instance."
}

variable "desired_status" {
  description = "The desired status of the instance."
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the instance."
}

variable "hostname" {
  description = "The hostname of the instance."
}

variable "labels" {
  description = "The labels assigned to the instance."
}

variable "metadata" {
  description = "The metadata assigned to the instance."
}

variable "metadata_startup_script" {
  description = "The startup script for the instance metadata."
}

variable "min_cpu_platform" {
  description = "The minimum CPU platform for the instance."
}

variable "project" {
  description = "The project ID or project number where the instance will be created."
}

variable "tags" {
  description = "The tags assigned to the instance."
}

variable "boot_disk" {
  description = "The boot disk configuration for the instance."
  type = map(object({
    auto_delete             = bool
    device_name             = string
    mode                    = string
    disk_encryption_key_raw = string
    kms_key_self_link       = string
    source                  = string
    initialize_params = map(object({
      size   = string
      image  = string
      labels = map(string)
    }))
  }))
}

variable "network_interface" {
  description = "The network interface configuration for the instance."
  type = map(object({
    network            = string
    subnetwork         = string
    subnetwork_porject = string
    network_ip         = string
    nic_type           = string
    stack_type         = string
    queue_count        = number
    access_config = map(object({
      nat_ip                 = string
      public_ptr_domain_name = string
      network_tier           = string
    }))
    alias_ip_range = map(object({
      ip_cidr_range         = string
      subnetwork_range_name = string
    }))
    ipv6_access_config = map(object({
      public_ptr_domain_name = string
      network_tier           = string
    }))
  }))
}

variable "attached_disk" {
  description = "The attached disk configuration for the instance."
  type = map(object({
    source                  = string
    device_name             = string
    mode                    = string
    disk_encryption_key_raw = string
    kms_key_self_link       = string
  }))
}

variable "guest_accelerator" {
  description = "The guest accelerator configuration for the instance."
  type = map(object({
    type  = string
    count = number
  }))
}

variable "scheduling" {
  description = "The scheduling configuration for the instance."
  type = map(object({
    preemptible                 = bool
    on_host_maintenance         = string
    automatic_restart           = bool
    node_affinities             = list(map(string))
    min_node_cpus               = number
    provisioning_models         = list(string)
    instance_termination_action = string
    max_run_duration            = string
    nanos                       = number
    seconds                     = number
    maintenance_interval        = string
    type                        = string
    count                       = number
  }))
}

variable "scratch_disk" {
  description = "The scratch disk configuration for the instance."
  type = map(object({
    interface = string
  }))
}

variable "service_account" {
  description = "The service account configuration for the instance."
  type = map(object({
    email  = string
    scopes = list(string)
  }))
}

variable "shielded_instance_config" {
  description = "The shielded instance configuration for the instance."
  type = map(object({
    enable_secure_boot          = bool
    enable_vtpm                 = bool
    enable_integrity_monitoring = bool
  }))
}
