# Dotfiles - Personal Development Environment

A comprehensive dotfiles configuration using [chezmoi](https://chezmoi.io/) for managing development environment setup across multiple machines. This configuration uses **mise** (formerly rtx) for development tool management and includes automated testing infrastructure.

## 🚀 Quick Start

```bash
# Install chezmoi if not already installed
curl -sfL https://chezmoi.io/get | sh

# Initialize and apply dotfiles
chezmoi init --apply https://github.com/peterjmorgan/dotfiles-peterjmorgan.git
```

## 📋 What's Included

- **Shell Configuration**: Zsh with Oh My Zsh, Powerlevel10k theme, and custom aliases
- **Development Tools**: mise for tool management, uv for Python tools
- **Editors**: Neovim with Packer plugin management
- **Terminal**: tmux configuration with custom settings
- **Security**: 1Password CLI integration with encrypted SSH keys
- **Languages**: Go, Python, Node.js (via mise)
- **Utilities**: fzf, ripgrep, bat, and more

## 🗂️ Project Structure & File Operations

### Core Configuration Files

| File | Purpose | Chezmoi Operation |
|------|---------|-------------------|
| `dot_zshrc.tmpl` | Main zsh configuration template | → `~/.zshrc` (templated) |
| `dot_gitconfig` | Git global configuration | → `~/.gitconfig` |
| `dot_tmux.conf` | tmux configuration | → `~/.tmux.conf` |
| `dot_tmux.conf.local` | Local tmux overrides | → `~/.tmux.conf.local` |
| `dot_p10k.zsh` | Powerlevel10k theme config | → `~/.p10k.zsh` |
| `dot_antigenrc` | Antigen plugin configuration | → `~/.antigenrc` |

### Directory Structures

| Directory | Purpose | Chezmoi Operation |
|-----------|---------|-------------------|
| `dot_config/` | XDG config directory | → `~/.config/` |
| `dot_config/nvim/` | Neovim configuration | → `~/.config/nvim/` |
| `dot_zsh/` | Zsh modules and functions | → `~/.zsh/` |
| `dot_claude/` | Claude AI integration | → `~/.claude/` |
| `private_dot_ssh/` | SSH configuration (encrypted) | → `~/.ssh/` |

### Encrypted Files

| File | Purpose | Chezmoi Operation |
|------|---------|-------------------|
| `encrypted_*.age` | Age-encrypted sensitive files | Decrypted to target locations |
| `key.txt.age` | Master encryption key | Used for decrypting other files |
| `private_dot_ssh/encrypted_*` | SSH keys and config | → `~/.ssh/` (decrypted) |

## 🔄 Order of Operations

Chezmoi processes files in a specific order during `chezmoi apply`:

### 1. Pre-Installation Scripts (run_once_before_*)
```
.chezmoiscripts/run_once_before-01-decrypt-private-key.sh.tmpl
```
- **Purpose**: Decrypt the master key for other encrypted files
- **When**: Before any files are installed
- **Condition**: Only in interactive environments

### 2. File Installation
All `dot_*` files and directories are processed and installed to their target locations.

### 3. Post-Installation Scripts (run_once_after_*)
```
.chezmoiscripts/run_once_after-05-install-mise.sh
.chezmoiscripts/run_once_after-06-install-uv.sh  
.chezmoiscripts/run_once_after-15-install-packages.sh.tmpl
```

#### Step 3a: Install mise
- Downloads and installs mise to `~/.local/bin/mise`
- Sets up PATH configuration
- Initializes mise for shell integration

#### Step 3b: Install uv
- Downloads and installs uv to `~/.local/bin/uv`
- Python package and tool manager
- Adds uv to PATH

#### Step 3c: Install Development Tools
- **Languages**: golang, neovim, tmux, 1password-cli (via mise)
- **Python Tools**: llm, ipython (via uv tool install)
- **System Tools**: age, just, packer.nvim

### 4. Template Processing

Templates (`.tmpl` files) are processed with data from:
- `.chezmoidata.yaml` - Tool installation lists and configurations
- `.chezmoi.toml.tmpl` - Chezmoi configuration (conditional encryption)
- Environment variables and system information

## 🔧 Chezmoi File Naming Conventions

| Prefix | Purpose | Example |
|--------|---------|---------|
| `dot_` | Creates dotfiles | `dot_zshrc` → `~/.zshrc` |
| `private_` | Restricts permissions (600) | `private_dot_ssh` → `~/.ssh/` |
| `encrypted_` | Requires decryption | `encrypted_config.age` → decrypted file |
| `run_once_` | Executable scripts (run once) | `run_once_after-05-install-mise.sh` |
| `literal_` | Prevent name processing | `literal_filename` → `filename` |
| `.tmpl` | Template processing | `.tmpl` suffix processes Go templates |

## 🧪 Testing

### Automated Testing
```bash
# Run comprehensive automated tests
./test-dotfiles-automated.sh

# Run manual testing in Docker
./test-dotfiles.sh
```

### Test Coverage
The `verify-dotfiles-installation.sh` script includes 40+ automated tests:

- ✅ Mise installation and functionality
- ✅ UV tool installation and management  
- ✅ Language runtime installations
- ✅ Python tool installations (llm, ipython)
- ✅ PATH configuration verification
- ✅ Shell integration checks
- ✅ File installation verification
- ✅ Encryption/decryption functionality

### Docker Testing Environment
```dockerfile
# Dockerfile creates clean Ubuntu environment for testing
FROM ubuntu:22.04
# ... includes all necessary dependencies for testing
```

## 📊 Configuration Management

### .chezmoidata.yaml
Central configuration file that defines:
```yaml
packages:
  mise:
    - golang@latest
    - neovim@latest
    - tmux@3.3
    - 1password-cli@latest
  uv:
    - llm  # AI CLI tool
    - ipython  # Enhanced Python REPL
```

### .chezmoi.toml.tmpl
Chezmoi configuration template:
- Conditional age encryption (only when key exists)
- Git repository configuration
- Template data sourcing

## 🛠️ Development Workflow

### Making Changes
1. Edit files in the chezmoi source directory
2. Test changes: `chezmoi diff`
3. Apply changes: `chezmoi apply`
4. Test in Docker: `./test-dotfiles-automated.sh`

### Adding New Tools
1. Add to `.chezmoidata.yaml` under appropriate package manager
2. Update installation scripts if needed
3. Add verification tests to `verify-dotfiles-installation.sh`
4. Test the complete workflow

### Debugging
```bash
# Check chezmoi status
chezmoi status

# See what would be applied
chezmoi diff

# Verbose output
chezmoi apply --verbose

# Check specific file processing
chezmoi cat ~/.zshrc
```

## 🔐 Security Features

- **Age Encryption**: Sensitive files encrypted with age
- **SSH Key Management**: Encrypted SSH keys with 1Password integration
- **Conditional Decryption**: Only decrypts in interactive environments
- **Secure Testing**: Automated tests skip decryption in CI/CD

## 📦 Key Dependencies

- **chezmoi**: Dotfile management
- **mise**: Development tool version management
- **uv**: Python package and tool management
- **age**: File encryption
- **zsh**: Shell with Oh My Zsh framework
- **tmux**: Terminal multiplexer
- **neovim**: Text editor

## 🚨 Troubleshooting

### Common Issues

1. **Tools not found**: Ensure `~/.local/bin` is in PATH
2. **Encryption errors**: Check if key.txt.age is properly decrypted
3. **Installation order**: Scripts run in numbered order (05, 06, 15)
4. **Template errors**: Check `.chezmoidata.yaml` syntax

### Logs and Debugging
```bash
# Check installation logs
chezmoi apply --verbose

# Verify tool installations
mise list
uv tool list

# Run verification tests
./verify-dotfiles-installation.sh
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes and test thoroughly
4. Run automated tests: `./test-dotfiles-automated.sh`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details. 