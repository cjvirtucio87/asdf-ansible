# asdf-ansible

This is a fork of the [ansible](https://github.com/Bleacks/asdf-ansible-plugin) plugin for the [asdf version manager](https://asdf-vm.com). The main difference is that it does not assume a global install of `python`, and therefore will not expect the `ansible` executable to be installed on your plugin manager's install directory for `ansible`.

For example, when using the [python plugin](https://github.com/asdf-community/asdf-python) for `asdf`, the `ansible` executable will be installed in the install directory for `python`, because ansible is installed using that install's `pip` executable, not a global one.

More specifically, this fork is useful for avoiding the following error:

```console
+ fail 'Expected /home/cjvirtucio/.local/share/rtx/installs/ansible/9.1.0/bin/ansible to be executable.'
+ echo -e 'asdf-ansible: Expected /home/cjvirtucio/.local/share/rtx/installs/ansible/9.1.0/bin/ansible to be executable.'
asdf-ansible: Expected /home/cjvirtucio/.local/share/rtx/installs/ansible/9.1.0/bin/ansible to be executable.
+ exit 1
+ rm -rf /home/cjvirtucio/.local/share/rtx/installs/ansible/9.1.0
+ fail 'An error ocurred while installing ansible 9.1.0.'
+ echo -e 'asdf-ansible: An error ocurred while installing ansible 9.1.0.'
+ exit 1
```

## Installation

To start using this plugin, add it with your desired manager (e.g. [asdf](https://asdf-vm.com) or [rtx](https://github.com/jdx/rtx)):

```console
asdf plugins add https://github.com/cjvirtucio87/asdf-ansible.git
```
