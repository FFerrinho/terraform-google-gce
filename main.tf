resource "google_compute_instance" "main" {
  machine_type              = var.machine_type
  name                      = var.name
  zone                      = var.zone
  allow_stopping_for_update = var.allow_stopping_for_update
  can_ip_forward            = var.can_ip_forward
  description               = var.description
  desired_status            = var.desired_status
  deletion_protection       = var.deletion_protection
  hostname                  = var.hostname
  labels                    = var.labels
  metadata                  = var.metadata
  metadata_startup_script   = var.metadata_startup_script
  min_cpu_platform          = var.min_cpu_platform
  project                   = var.project
  tags                      = var.tags

  dynamic "boot_disk" {
    for_each = var.boot_disk
    content {
      auto_delete             = lookup(boot_disk.value, "auto_delete", null)
      device_name             = lookup(boot_disk.value, "device_name", null)
      mode                    = lookup(boot_disk.value, "mode", null)
      disk_encryption_key_raw = lookup(boot_disk.value, "disk_encryption_key_raw", null)
      kms_key_self_link       = lookup(boot_disk.value, "kms_key_self_link", null)
      source                  = lookup(boot_disk.value, "source", null)

      dynamic "initialize_params" {
        for_each = lookup(boot_disk.value, "initialize_params", [])
        content {
          size   = lookup(initialize_params.value, "size", null)
          image  = lookup(initialize_params.value, "image", null)
          labels = lookup(initialize_params.value, "labels", null)
        }
      }
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      network            = lookup(network_interface.value, "network", null)
      subnetwork         = lookup(network_interface.value, "subnetwork", null)
      subnetwork_porject = lookup(network_interface.value, "subnetwork_porject", null)
      network_ip         = lookup(network_interface.value, "network_ip", null)
      nic_type           = lookup(network_interface.value, "nic_type", null)
      stack_type         = lookup(network_interface.value, "stack_type", null)
      queue_count        = lookup(network_interface.value, "queue_count", null)

      dynamic "access_config" {
        for_each = lookup(network_interface.value, "access_config", [])
        content {
          nat_ip                 = lookup(access_config.value, "nat_ip", null)
          public_ptr_domain_name = lookup(access_config.value, "public_ptr_domain_name", null)
          network_tier           = lookup(access_config.value, "network_tier", null)
        }
      }

      dynamic "alias_ip_range" {
        for_each = lookup(network_interface.value, "alias_ip_range", [])
        content {
          ip_cidr_range         = lookup(alias_ip_range.value, "ip_cidr_range", null)
          subnetwork_range_name = lookup(alias_ip_range.value, "subnetwork_range_name", null)
        }
      }

      dynamic "ipv6_access_config" {
        for_each = lookup(network_interface.value, "ipv6_access_config", [])
        content {
          public_ptr_domain_name = lookup(ipv6_access_config.value, "public_ptr_domain_name", null)
          network_tier           = lookup(ipv6_access_config.value, "network_tier", null)
        }
      }
    }
  }

  dynamic "attached_disk" {
    for_each = var.attached_disk
    content {
      source                  = lookup(attached_disk.value, "source", null)
      device_name             = lookup(attached_disk.value, "device_name", null)
      mode                    = lookup(attached_disk.value, "mode", null)
      disk_encryption_key_raw = lookup(attached_disk.value, "disk_encryption_key_raw", null)
      kms_key_self_link       = lookup(attached_disk.value, "kms_key_self_link", null)
    }
  }

  dynamic "guest_accelerator" {
    for_each = var.guest_accelerator
    content {
      type  = lookup(guest_accelerator.value, "type", null)
      count = lookup(guest_accelerator.value, "count", null)
    }
  }

  dynamic "scheduling" {
    for_each = var.scheduling
    content {
      preemptible                 = lookup(scheduling.value, "preemptible", null)
      on_host_maintenance         = lookup(scheduling.value, "on_host_maintenance", null)
      automatic_restart           = lookup(scheduling.value, "automatic_restart", null)
      node_affinities             = lookup(scheduling.value, "node_affinities", null)
      min_node_cpus               = lookup(scheduling.value, "min_node_cpus", null)
      provisioning_models         = lookup(scheduling.value, "provisioning_model", null)
      instance_termination_action = lookup(scheduling.value, "instance_termination_action", null)
      max_run_duration            = lookup(scheduling.value, "max_run_duration", null)
      nanos                       = lookup(scheduling.value, "nanos", null)
      seconds                     = lookup(scheduling.value, "seconds", null)
      maintenance_interval        = lookup(scheduling.value, "maintenance_interval", null)
      type                        = lookup(scheduling.value, "type", null)
      count                       = lookup(scheduling.value, "count", null)
    }
  }

  dynamic "scratch_disk" {
    for_each = var.scratch_disk
    content {
      interface = lookup(scratch_disk.value, "interface", null)
    }
  }

  dynamic "service_account" {
    for_each = var.service_account
    content {
      email  = lookup(service_account.value, "email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

  dynamic "shielded_instance_config" {
    for_each = var.shielded_instance_config
    content {
      enable_secure_boot          = lookup(shielded_instance_config.value, "enable_secure_boot", null)
      enable_vtpm                 = lookup(shielded_instance_config.value, "enable_vtpm", null)
      enable_integrity_monitoring = lookup(shielded_instance_config.value, "enable_integrity_monitoring", null)
    }
  }
}
