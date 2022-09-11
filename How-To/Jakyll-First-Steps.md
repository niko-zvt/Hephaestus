

## Install Jekyll and dependencies

Install Ruby and other prerequisites:

    sudo apt-get install ruby-full build-essential zlib1g-dev

Avoid installing RubyGems packages (called gems) as the root user. Instead, set up a gem installation directory for your user account. The following commands will add environment variables to your `~/.bashrc` file to configure the gem installation path:

    echo '# Install Ruby Gems to ~/Dev/RubyGems' >> ~/.bashrc
    echo 'export GEM_HOME="$HOME/Dev/RubyGems"' >> ~/.bashrc
    echo 'export PATH="$HOME/Dev/RubyGems/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

Finally, install Jekyll and Bundler:

    gem install jekyll bundler

That’s it! You’re ready to start using Jekyll.

Create a new `Gemfile` to list your project’s dependencies:

    bundle init

Edit the `Gemfile` in a text editor and add jekyll as a dependency:

    gem "jekyll"

Run `bundle` to install jekyll for your project.

You can now prefix all jekyll commands listed in this tutorial with `bundle exec` to make sure you use the jekyll version defined in your `Gemfile`.

### Trick
> If you are using Ruby version 3.0.0 or higher, command `bundle exec jekyll serve` may fail. You may fix it by adding `webrick` to your dependencies: `bundle add webrick`.

## Create a site

It’s time to create a site! Create a new directory for your site and name it whatever you want. Through the rest of this tutorial we’ll refer to this directory as **root**.

You can also initialize a Git repository here.

Let’s add your first file. Create `index.html` in root with the following content:

```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

## Build

Since Jekyll is a static site generator, it has to build the site before we can view it. Run either of the following commands to build your site:

* `jekyll build` - Builds the site and outputs a static site to a directory called `_site`.
* `jekyll serve` - Does `jekyll build` and runs it on a local web server at http://localhost:4000, rebuilding the site any time you make a change.

### Trick
> Pass the `--livereload` option to serve to automatically refresh the page with each change you make to the source files: `bundle exec jekyll serve --livereload`

### **ATTENTION**
> The version of the site that `jekyll serve` builds in `_site` is not suited for deployment. Links and asset URLs in sites created with `jekyll serve` will use https://localhost:4000 or the value set with command-line configuration, instead of the values set in [your site’s configuration file](https://jekyllrb.com/docs/configuration/). To learn about how to build your site when it’s ready for deployment, read the [Deployment](https://jekyllrb.com/docs/step-by-step/10-deployment/) section of this tutorial.

Run jekyll serve and go to http://localhost:4000 in your browser. You should see “Hello World!”.

At this point, you might be thinking, “So what?”. The only thing that happened was that Jekyll copied an HTML file from one place to another.

Patience, young grasshopper, there’s still much to learn!

Next. you’ll learn about Liquid and templating.

## [JAKYLL STEP BY STEP](https://jekyllrb.com/docs/step-by-step/01-setup/)