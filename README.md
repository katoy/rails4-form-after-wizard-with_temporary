
[![Build Status](https://travis-ci.org/katoy/rails4-form-after-wizard.svg?branch=master)](https://travis-ci.org/katoy/rails4-form-after-wizard)
[![Dependency Status](https://gemnasium.com/katoy/rails4-form-after-wizard.png)](https://gemnasium.com/katoy/rails4-form-after-wizard)
[![Coverage Status](https://coveralls.io/repos/katoy/rails4-form-after-wizard/badge.png?branch=master)](https://coveralls.io/r/katoy/rails4-form-after-wizard?branch=master)

これは、rails4 アプリケーションでの Form 画面のサンプルです。  
[別レポジトリーでの form 画面](https://github.com/katoy/rails4-form-before-wizard) を wizard 形式に変更したものです。  

#
# 実行

    $ bundle install
	$ RAILS_ENV=test ./bin/rake db:create db:migrate db:test:prepare
	$ RAILS_ENV=test ./bin/rake spec

[./screenshots/*.png](./screenshots/) に主なシーンのスクリーンショットが保存される。  
[./coverage/rcov/index.html](./coverage/rcov/index.html) にテストカバレッジレポートが保存される。  


//--- End of File ---
