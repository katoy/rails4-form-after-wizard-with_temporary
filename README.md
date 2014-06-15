
[![Build Status](https://travis-ci.org/katoy/rails4-form-after-wizard-with_temporary.svg?branch=master)](https://travis-ci.org/katoy/rails4-form-after-wizard-with_temporary)
[![Dependency Status](https://gemnasium.com/katoy/rails4-form-after-wizard-with_temporary.png)](https://gemnasium.com/katoy/rails4-form-after-wizard-with_temporary)
[![Coverage Status](https://coveralls.io/repos/katoy/rails4-form-after-wizard-with_temporary/badge.png?branch=master)](https://coveralls.io/r/katoy/rails4-form-after-wizard-with_temporary?branch=master)

これは、rails4 アプリケーションでの Form 画面のサンプルです。  
[別レポジトリーでの wizard な form 画面](https://github.com/katoy/rails4-form-after-wizard) を編集中データをtemporaroy な DB に保存するようにしたバージョンです。  

参考：  
[https://github.com/vlado/rails_temporary_data](https://github.com/vlado/rails_temporary_data)  
> Rails engine to simply save big temporary data (too big for session cookie store) in a database. It is great for a step-by-step wizard or similar functionality.  

#
# 実行

    $ bundle install
	$ RAILS_ENV=test ./bin/rake db:create db:migrate db:test:prepare
	$ RAILS_ENV=test ./bin/rake spec

[./screenshots/*.png](./screenshots/) に主なシーンのスクリーンショットが保存される。  
[./coverage/rcov/index.html](./coverage/rcov/index.html) にテストカバレッジレポートが保存される。  


//--- End of File ---
