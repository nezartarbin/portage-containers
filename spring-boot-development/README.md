# Spring Boot Development Container

A container intended for developing spring boot applications. It bootstraps Java development dependencies and some tools for development.

## What is Included

- Alpine Linux as the base image
- Eclipse Temurin JDK (Formerly Adoptium JDK)
- Apache Maven
- Spring CLI
- bash (required by Spring CLI)
- curl (used during the installation, but is handy for development use)

## Considerations for the Future

- Making version numbers ARGs
- checksum validation for spring boot CLI (this is done for JDK and Maven already)
- neovim setup for java development
- git
