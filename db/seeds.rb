Rails.logger.info('Creating users...')
Admin.create!(email: 'admin@admin.com', password: 'qwertyuiop')
Rails.logger.info('Users created successfully')
