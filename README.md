# dotfiles

My dotfiles based on Omarchy and managed by [chezmoi](https://www.chezmoi.io).

## Usage

### Prerequisits

- [Arch Linux](https://archlinux.org) (btw.)
- [Omarchy](https://omarchy.org)

### Setup

#### Additional packages

Install required packages not included in Omarchy:

```bash
yay -S atuin chezmoi fish libfido2 starship ttf-firacode-nerd
```

#### SSH key

Generate a new SSH key with Yubikey:

```bash
# use CapsLock + Space + E shortcut to enter email
# use default location for SSH key
# use no passphrase as private key is protected by Yubikey
ssh-keygen -t ed25519-sk -C <email>
```

Login to Github and add SSH key for authentication:

```bash
gh auth login
```

Add SSH key for signing:

```bash
gh auth refresh -h github.com -s admin:ssh_signing_key
gh ssh-key add ~/.ssh/id_ed25519_sk.pub --type signing --title <key_name>
```

#### Setup dotfiles

Init and apply chezmoi:

```bash
# when promted for email use CapsLock + Space + E shortcut
chezmoi init --ssh --apply jehrhardt
```

#### Use Fish

Make fish the default shell:

```bash
echo $( which fish ) | sudo tee -a /etc/shells
chsh -s $( which fish )
```

#### Sync shell history

Login to atuin:

```bash
atuin login
atuin sync
```
