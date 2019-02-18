[![Netlify Status](https://api.netlify.com/api/v1/badges/a0c3b947-b8e8-431c-abe2-6f35d5620575/deploy-status)](https://app.netlify.com/sites/adamsimpsonnet/deploys)

## Build

`make` will attempt to build CSS and run a local binary of [cycle](https://github.com/asimpson/cycle) to build the site.

`make cycle` will download the cycle binary (for Linux only at the moment).

`make clean` will delete `site/` dir and `site.css` file.

## Styles

[Tachyons](http://tachyons.io/) is included in the repo.

Any additional custom CSS should happen in `custom.css`.

## Posts

Each post is two files: a markdown file and a corresponding JSON file.

The JSON file is the contextual data for the matching post.

## Pages

Pages have the same structure as posts: a markdown file and a JSON file for data.

The JSON files _must have_ a permalink defined.

``` json
{
  "permalink": "/foo/bar",
}
```
