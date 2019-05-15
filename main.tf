data "ibm_compute_ssh_key" "bastion_key" {
  label = "ryan_outlier"
}

resource "ibm_compute_vm_instance" "private_node" {
  count                      = "${var.node_count}"
  hostname                   = "${var.hostname}-${count.index+1}"
  domain                     = "${var.domain}"
  os_reference_code          = "${var.os_reference_code}"
  datacenter                 = "${var.datacenter}"
  network_speed              = 1000
  hourly_billing             = true
  private_network_only       = true
  user_metadata              = "${var.user_metadata}"
  flavor_key_name            = "${var.flavor_key_name}"
  local_disk                 = "${var.localdisk}"
  tags                       = ["ryantiffany", "ansible-node"]
  private_security_group_ids = ["${data.ibm_security_group.allow_bastion_ssh.id}", "${data.ibm_security_group.allow_outbound.id}"]
  ssh_key_ids                = ["${data.ibm_compute_ssh_key.bastion_key.id}"]
}
