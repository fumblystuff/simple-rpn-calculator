const { EleventyHtmlBasePlugin } = require('@11ty/eleventy');
const embedYouTube = require('eleventy-plugin-youtube-embed');

// local plugins
const pluginImages = require("./eleventy.config.images.js");
// Create a helpful production flag
const isProduction = process.env.NODE_ENV === 'production';

module.exports = eleventyConfig => {

  eleventyConfig.addPlugin(EleventyHtmlBasePlugin);
  eleventyConfig.addPlugin(embedYouTube);
  eleventyConfig.addPlugin(pluginImages, { debugMode: false });

  eleventyConfig.addPassthroughCopy({ 'src/favicon/*': '/' });
  [
    // Data files
    "src/_data/*",
    "src/assets/",
  ].forEach((path) => {
    eleventyConfig.addPassthroughCopy(path);
  });

  return {
    dir: {
      input: 'src',
      output: "_site",
      includes: "_includes",
      layouts: "_layouts",
      data: "_data"
    }
  }

};