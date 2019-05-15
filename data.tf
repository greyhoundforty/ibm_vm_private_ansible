data "ibm_security_group" "allow_bastion_ssh" {
  name = "allow_ssh_from_bastion"
}

data "ibm_security_group" "allow_outbound" {
  name = "allow_outbound"
}

data "ibm_compute_ssh_key" "bastion_key" {
  label = "ryan_outlier"
}
