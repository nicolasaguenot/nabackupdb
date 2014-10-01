
SET @find="distilleriedusavoir.local";
SET @replace="distilleriedusavoir.naguenot.com";

UPDATE wp_options  SET option_value = REPLACE(option_value,@find,@replace);
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value,@find,@replace);
UPDATE wp_posts  SET guid = REPLACE(guid,@find,@replace);
UPDATE wp_posts  SET post_content = REPLACE(post_content,@find,@replace);


/*
UPDATE wp_commentmeta SET text = REPLACE(text,@find,@replace);
UPDATE wp_comments  SET text = REPLACE(text,@find,@replace);
UPDATE wp_links  SET text = REPLACE(text,@find,@replace);
UPDATE wp_terms SET text = REPLACE(text,@find,@replace);
UPDATE wp_term_relationships SET text = REPLACE(text,@find,@replace);
UPDATE wp_term_taxonomy SET text = REPLACE(text,@find,@replace);
UPDATE wp_usermeta SET text = REPLACE(text,@find,@replace);
UPDATE wp_users SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_attribute_taxonomies SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_downloadable_product_permissions SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_order_itemmeta SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_order_items SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_tax_rates SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_tax_rate_locations SET text = REPLACE(text,@find,@replace);
UPDATE wp_woocommerce_termmeta SET text = REPLACE(text,@find,@replace);
*/