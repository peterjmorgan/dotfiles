# Testing Your Dotfiles

This directory contains Docker-based testing tools to validate your chezmoi dotfiles installation before deploying to your actual machines.

## Quick Start

### Interactive Testing
```bash
./test-dotfiles.sh
```

This will:
1. Build a Docker container with Ubuntu 22.04
2. Install chezmoi and apply your dotfiles
3. Start an interactive zsh session where you can test your configuration

### Automated Testing
```bash
./test-dotfiles-automated.sh
```

This runs a series of automated tests to verify:
- Zsh shell functionality
- Mise installation
- Antigen configuration
- Key configuration files
- Just command runner

## What Gets Tested

The Docker container simulates a fresh Ubuntu 22.04 installation and:

1. **Installs essential packages**: curl, git, zsh, sudo, build-essential
2. **Installs chezmoi**: Downloads and installs the latest version
3. **Applies your dotfiles**: Runs `chezmoi init --apply peterjmorgan`
4. **Sets up zsh**: Configures zsh as the default shell
5. **Creates test user**: Optional user for testing user-specific configs

## Manual Testing Checklist

When testing interactively, check these common areas:

### Shell Configuration
- [ ] Zsh starts without errors
- [ ] Aliases work (try `ll`, `gs`, etc.)
- [ ] Functions are available
- [ ] Key bindings work
- [ ] Prompt displays correctly

### Tool Installation
- [ ] Mise is installed and working
- [ ] Just is available
- [ ] Antigen plugins load correctly
- [ ] Neovim can be launched (if configured)

### Environment Setup
- [ ] PATH includes expected directories
- [ ] Environment variables are set
- [ ] Shell completions work

## Troubleshooting

### Common Issues

1. **Build fails**: Check that Docker is running and you have sufficient disk space
2. **Chezmoi fails**: Verify your repository is accessible and the username is correct
3. **Zsh errors**: Check for syntax errors in your zsh configuration files
4. **Missing tools**: Ensure all required tools are properly configured in your chezmoi setup

### Debug Mode

To run with more verbose output:
```bash
docker build -t dotfiles-test . --progress=plain
docker run -it --rm dotfiles-test /bin/zsh -l
```

### Testing Specific Components

To test just the shell configuration:
```bash
docker run --rm dotfiles-test /bin/zsh -c "source ~/.zshrc && echo 'Shell loaded successfully'"
```

## Continuous Integration

You can integrate these tests into your CI/CD pipeline:

```yaml
# Example GitHub Actions workflow
- name: Test dotfiles
  run: |
    docker build -t dotfiles-test .
    ./test-dotfiles-automated.sh
```

## Customization

### Testing Different OS Versions

Modify the `Dockerfile` to test different base images:
```dockerfile
FROM ubuntu:20.04  # Test Ubuntu 20.04
FROM debian:bullseye  # Test Debian
FROM alpine:latest  # Test Alpine Linux
```

### Testing User-Specific Configurations

Switch to the test user in the container:
```bash
docker run -it --rm dotfiles-test su - testuser
```

### Adding More Tests

Extend `test-dotfiles-automated.sh` to include additional checks for your specific setup. 