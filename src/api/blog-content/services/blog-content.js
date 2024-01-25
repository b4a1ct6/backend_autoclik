'use strict';

/**
 * blog-content service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::blog-content.blog-content');
