'use strict';

/**
 * product-amp service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::product-amp.product-amp');
