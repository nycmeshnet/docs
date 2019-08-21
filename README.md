# NYC Mesh Docs

This repository contains the public-facing [NYC Mesh Documentation](https://docs.nycmesh.net/) website. It is intended to provide interested community members a sort of manual or guidebook discussing how to get involved in the community network from a technical perspective. It is not a networking tutorial, and does assume that readers have some familiarity with basic networking concepts, but we strive to provide external links suggested educational resources for newcomers when it makes sense for us to do so.

The remainder of this document describes the process for contributing to the documentation itself or developing the documentation website.

## Contents

1. [Getting Started](#getting-started)
    1. [Prerequisites](#prerequisites)
    1. [Software](#software)
    1. [Initial Setup](#initial-setup)
1. [Making Changes](#making-changes)
    1. [Editing the Docs](#editing-the-docs)
    1. [Editing the Code](#editing-the-code)
    1. [Uploading Your Edits](#uploading-your-edits)
1. [Contributors](#contributors)
1. [Getting Help](#getting-help)

## Getting Started

The best way to start is to make a local copy of the `docs` website on your development computer. This way, you can experiment safely, without affecting the live site.

### Prerequisites

To develop locally, you will need:

* a computer with a modern operating system, such as
    * [macOS](https://www.apple.com/macos/),
    * [Windows](https://www.microsoft.com/windows/), or
    * any flavor of GNU/Linux (we like [Ubuntu](https://ubuntu.com/download/desktop) and [Fedora](https://getfedora.org/workstation/)),
* an active Internet connection,
* [a (free) GitHub.com account](https://github.com/join),
* basic command-line (terminal/shell) experience. If you have never touched a command line before, consider spending an hour at [Codecademy's interactive tutorial, "Learn the Command Line"](https://www.codecademy.com/learn/learn-the-command-line) (for macOS or GNU/Linux users), [Computer Hope's article, "How to use the Windows command line (DOS)" (for Windows users)](http://www.computerhope.com/issues/chusedos.htm), or the [Anarcho-Tech NYC Collective's command-line introductory practice lab](https://github.com/AnarchoTechNYC/meta/blob/master/train-the-trainers/practice-labs/securing-a-shell-account-on-a-shared-server/README.md).

### Software

In addition to the [prerequisites](#prerequisites) above, you will need to install the following software on your computer:

* [Git](https://git-scm.com/) - Free and open source distributed version control system. See GitHub's own help article, [Set up Git](https://help.github.com/en/articles/set-up-git) for additional instructions.
* [Hugo](https://gohugo.io/) - One of the most popular open-source static site generators, and the one on which our Documentation website is built. See the [Hugo project's documentation for installation](https://gohugo.io/getting-started/installing/) instructions specific to your platform.

### Initial Setup

After you have installed the necessary [software](#software) on your development computer, you will need to download our website's source code for the first time. Git calls this process "cloning." To *clone* our repository, use the following command in your terminal or shell:

```bash
git clone https://github.com/nycmeshnet/docs.git nycmesh-docs
```

The above will create a folder called `nycmesh-docs` that is an exact copy of the code published on our GitHub Organization's repository.

At this point, you should be able to go into the project folder (`cd nycmesh-docs` on your command line) and start the Hugo server:

```bash
cd nycmesh-docs # Enter the project directory.
hugo server     # Start the Hugo development server.
```

If successful, Hugo will print a message that shows you where the development copy of the website is running. This will probably be [http://localhost:1313](http://localhost:1313/), as that is Hugo's default. Open your Web browser to the address Hugo reports and you will be able to browse a local copy of the documentation website running on your computer.

### Making Changes

The source code for this repository contains both the Documentation website's codebase (HTML templates, CSS stylesheets, and more) as well as the documentation content itself. You are welcome to offer your suggestions for improving any and all parts of this website.

### Editing the Docs

Our website codebase generally follows [Hugo's content management](https://gohugo.io/content-management/) best practices.

All documentation content is located in [the `content` folder](content/). Each folder inside the `content` folder is its own [section](https://gohugo.io/content-management/sections/). You can edit existing pages or create new ones by editing or creating files in any of these folders. By default, any changes you make will trigger Hugo to start a [live rebuild](https://gohugo.io/getting-started/usage/#livereload), so you can see your changes in your browser immediately upon saving the file.

For example, to add a new doc in [the Hardware section](content/hardware/), create a new file such as `content/hardware/awesome-device.md` in that section's folder. Begin that file with [Hugo front matter](https://gohugo.io/content-management/front-matter/) to give the new page metadata such as a title:

```markdown
---
title: "Awesome Device"
---
```

Next, write the content for your new page below the front matter, so that your new file looks something like this:

```markdown
---
title: "Awesome Device"
---

This awesome device is great because it's so cheap and easy to install!
```

Once you save the file, check out the changes to the local copy of the documentation website in your browser. To learn more about editing content in Hugo, refer to [the official Hugo documentation](https://gohugo.io/documentation/).

### Editing the Code

> :construction: TODO: Better instructions for new contributors would be nice, here.

See the [`layouts`](layouts/) and [`static`](static/) folders.

### Uploading Your Edits

When you are happy with your changes, it is time to send them to the NYC Mesh Docs team for review. Their job is to ensure that the changes you made are accurate, function well in NYC Mesh's production environments, and improve the project as a whole. The NYC Mesh Docs team prefers to receive edits via [Pull Requests on GitHub](https://help.github.com/en/articles/about-pull-requests), as this is the process by which we keep track of, review, and merge changes to the docs. If everything looks good, someone will merge your changes in to the main branch, which will update the public docs website.

For more information, please read ["Creating a pull request" in the official GitHub documentation](https://help.github.com/en/articles/creating-a-pull-request).

## Contributors

If you make many good changes, you may be invited to join the documentation project as a contributor. You may also ask us to grant you contributor access in [Slack](https://join.slack.com/t/nycmesh/shared_invite/enQtNDk0NDA4OTAyNDY0LTU5NWMyODY5ZTYyMDY2NzgzOTJmZjFmZTg3YWRjYjE0M2EyMzlhNDE3YmIxZmZhYTZmNjIwNTVkMDIwMjI2ZDg).

## Getting Help

As always, if you need any help, don't hesitate to reach out in our Slack group. [Invites to our Slack are available here](https://join.slack.com/t/nycmesh/shared_invite/enQtNDk0NDA4OTAyNDY0LTU5NWMyODY5ZTYyMDY2NzgzOTJmZjFmZTg3YWRjYjE0M2EyMzlhNDE3YmIxZmZhYTZmNjIwNTVkMDIwMjI2ZDg).
