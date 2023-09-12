# Portage-based Container Build System

This repository houses containerfiles for generating development-related container images. These images are built using Portage's build system and package manager.

## Problems with Other Container Systems

Most containerfiles perform a lot of manual package management. This is because most of them use Alpine Linux or Debian Linux as the base image. This creates a couple of problems.

### Alpine Linux

Alpine is a popular choice for Container images due to its incredibly lightweight size and performance. However, its package manager leaves a lot to desire. There are many popular softwares in use that are not packaged at Alpine, forcing the user to do it manually.

Another issue with Alpine is its use of musl libc for light foorprint. musl has come a long way, but can still cause issues that are very difficult to solve.

### Debian Linux

Debian is another popular choice. It uses glibc by default, so the musl issues are resolved. It has more packaged software than Alpine.  

However, Debian follows a strict 5-year long release system, and software in Debian is packaged according to it. This offers great stability, but if you need to use a version that is not several years old, you are out of luck.  

Most users tend to, again, perform package management manually. Unfortunately, if you use a recent version of software, and it depends on a system package (very common), you may experience compatibility issues, since your software has expectations of a newer version that does not exist. This issue can have cascading effects, forcing the user to manage more dependencies than they need.

## Features

- **Freedom to use almost any version of software or dependency** because portage builds against versions you already have, so compatibility issues are resolved
- **Installing multiple versions of a package or dependency, and easily switch between them**
- **Very easily write package definitions for software not present in the repos.** If the package you want is not already supported, the package manager will still manage dependencies and building for you
- **Choice between musl and glibc.** Both are supported!

## Project Structure

Most images use `ebuild-dev` as a base image, found under the `ebuild-dev` folder. `ebuild-dev` uses gentoo base, which has options for both musl and glibc.

Most Containerfiles merely copy a script in their `assets` folder and execute it to install the desired packages and set them up.

Many of my personal package recipes are referenced. They are found in [a separate repository](https://github.com/nezartarbin/carboxamide-portage-overlay.git) and can be used as examples for making new ones.

## Usability Status

The project currently has a lot of hard coded elements, as it is still a work in progress. These hard coded elements may need to be modified. They are things like the URL to my own container registry (which you probably dont have access to) or some local configurations of mine. If you do use this, then you probably want to inspect the code before running anything.  

## Future Considerations

This project currently is a list of Containers following a specific convention. The hope is to make this more user friendly by allowing the user to define the list of packages they want present, with options to choose versions and other customizations, and an image would be built for them.

Moreover, the images are currently not optimized for size, but development experience. Optimizing size is low hanging fruit right now. There are many optimizations that can be made. But I want to get the dev experience out of the way first.

## How to Use

With minimal modifications, these images are ready for build as they are. You can use either docker or podman.  

For podman, I already wrote scripts "build.sh" in each directory for automating it. You can follow the same recipe for docker.

Before building any image, make sure to read the code you are running, including the scripts. Some files are pointing to my personal container registry, which will fail on your end. I plan to make that part dynamic in the future, but in current state, you have to modify it.

