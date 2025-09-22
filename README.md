# dotfiles

My dotfiles based on Omarchy and managed by [chezmoi](https://www.chezmoi.io).

## Usage

### Prerequisits

- [Omarchy](https://omarchy.org)

### Setup

#### Additional packages

Install required packages not included in Omarchy:

```bash
yay -S atuin chezmoi fish libfido2 starship ttf-firacode-nerd
```

#### SSH key

Generate a new SSH key protected by Yubikey:

```bash
# use default location for SSH key
# use no passphrase
ssh-keygen -t ed25519-sk -C 59441+jehrhardt@users.noreply.github.com
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
chezmoi init --ssh --apply jehrhardt
```

#### Use Fish

Make fish the default shell:

```bash
echo $( which fish ) | sudo tee -a /etc/shells
chsh -s $( which fish )
```
