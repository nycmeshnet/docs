# NYC Mesh Docs

## Getting Started

Install [Hugo](https://gohugo.io):

```bash
brew install hugo
```

Clone this repo:

```bash
git clone https://github.com/nycmeshnet/docs.git nycmesh-docs
```

## Usage

Start the server:

```bash
cd nycmesh-docs
hugo serve
```

Navigate to the site at http://localhost:1313.

## Contributing

You'll need a GitHub account and a text editor. [Sublime Text](https://www.sublimetext.com) is a good, free option. You'll also need to be added as a contributor to the repository. Ask us in [Slack](https://join.slack.com/t/nycmesh/shared_invite/enQtNDk0NDA4OTAyNDY0LTU5NWMyODY5ZTYyMDY2NzgzOTJmZjFmZTg3YWRjYjE0M2EyMzlhNDE3YmIxZmZhYTZmNjIwNTVkMDIwMjI2ZDg) for help with this.

### Making Changes

All content is located in the `content` folder, organized by section. You can edit existing pages or create new ones by editing or creating files in this folder. Any changes you make will trigger a rebuild, so you can see them immediately in your browser.

For example, to add a new doc in the hardware section, create a new file `content/hardware/awesome-device.md` and give it a title:

```markdown
---
title: "Awesome Device"
---
```

Add your content below this metadata section, save, and check out the changes in your browser.

### Commiting your Changes

When you are happy with your changes, it is time to commit them to a new branch in the git repository.

First, switch to a new branch. The name is not super important, but try to pick something relevant to your changes.

```bash
git checkout -b 'awesome-device'
```

Running `git status` will show an overview of all changed files.  
If you changed a file by mistake, run `git checkout -- FILENAME` to reset it.

Commit the changes, and give your commit a message describing what changed:

```
git add *
git commit -m "Added a new doc for awesome device"
```

You should see a message like this:

```bash
 1 file changed, 36 insertions(+), 2 deletions(-)
```

### Making a Pull Request

Pull requests are the process by which we keep track of, review and merge changes to the docs.

Upload the changes to GitHub:

```bash
git push --set-upstream origin 'awesome-device' # Make sure to use the name of your branch
```

Go to https://github.com/nycmeshnet/docs/pulls and click the big green button that says "New pull request".

Find the dropdown menu labelled "compare", choose your branch, and click "Create pull request".

That's it! If everything looks good, someone will merge your changes in to the main branch, which will update the public docs website.

## Getting Help

As always, if you need any help, don't hesitate to reach out in our Slack group. Invites are available [here](https://join.slack.com/t/nycmesh/shared_invite/enQtNDk0NDA4OTAyNDY0LTU5NWMyODY5ZTYyMDY2NzgzOTJmZjFmZTg3YWRjYjE0M2EyMzlhNDE3YmIxZmZhYTZmNjIwNTVkMDIwMjI2ZDg)
