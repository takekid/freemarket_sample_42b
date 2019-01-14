# DB設計

## users table
| column       | type        | options                                 |
|:-------------|------------:|:---------------------------------------:|
| name         | string      | null: false                             |
| kana_name    | string      | null: false                             |
| nickname     | string      | index: true, null: false, unique: true  |
| avater       | text        | null: false, default ""                 |
| phonenumber  | string      | null: false, unique: true               |
| proceed      | integer     | null: false, default 0                  |
| point        | integer     | null: false, default 0                  |
| good_count   | integer     | null: false, default 0                  |
| normal_count | string      | null: false, default 0                  |

+ 上記の他にgem deviseによるカラム。

### Association
+ has_many :addresses
+ has_many :reviews, thorough: items
+ has_many :likes, thorough: items
+ has_many :items
+ has_many :transactions, thorough: items
+ has_many :creditcards



## addresses table
| column           | type        | options                        |
|:-----------------|------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| postal_code      | integer     | null: false                    |
| prefectures      | string      | null: false                    |
| city             | string      | null: false                    |
| address          | string      | null: false                    |
| building         | string      | null: true                     |

### Association
+ belongs_to :user



## reviews table
| column           | type        | options                        |
|:-----------------|------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## likes table
| column           | type        | options                        |
|:-----------------|------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## comments table
| column           | type        | options                        |
|:-----------------|------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |
| body             | text        | null: false                    |

### Association
+ belongs_to :user
+ belongs_to :item



## items table
| column             | type        | options                        |
|:-------------------|------------:|:------------------------------:|
| brand_id           | integer     | null: false, foreign_key: true |
| name               | text        | null: false, index: true       |
| introduction       | text        | null: false                    |
| type               | string      |                                |
| condition          | text        | null: false                    |
| size_id            | integer     | null: false, foreign_key: true |
| brand_id           | integer     | null: false, foreign_key: true |
| shippingfee        | string      | null: false                    |
| ship_from          | string      | null: false                    |
| shipping_date      | string      | null: false                    |
| price              | integer     | null: false                    |
| buyer_id           | integer     | null: false, foreign_key: true |
| seller_id          | integer     | null: false, foreign_key: true |

### Association
+ has_many :reviews, through: users
+ has_many :likes, through: users
+ has_many :comments, thorough: users
+ has_many :item_images
+ has_many :sizes
+ has_many :transactions, thorough: users

+ belongs_to :size
+ belongs_to :brand

+ Top_category,Middle_category,bottom_categoryと単一クラス継承を行う


## item_images table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| image            | text        | null: false, default: ""       |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :item



## top_categories table
| column            | type        | options                        |
|:----------------- |------------:|:------------------------------:|
| top_category_name | string      | null: false                    |
| item_id           | integer     | null: false, foreign_key: true |

+ ItemよりSTIを行う



## middle_categories table
| column               | type        | options                        |
|:---------------------|------------:|:------------------------------:|
| middle_category_name | string      | null: false                    |
| item_id              | integer     | null: false, foreign_key: true |


+ ItemよりSTIを行う



## bottom_categories table
| column               | type        | options                        |
|:---------------------|------------:|:------------------------------:|
| bottom_category_name | string      | null: false                    |
| item_id              | integer     | null: false, foreign_key: true |

+ ItemよりSTIを行う



## brands table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| name               | string      | null: false                    |

### Association
+ belongs_to :brand



## brandgroups table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| brand_id           | integer     | null: false, foreign_key: true |

### Association
+ has_many :items

+ belongs_to :brandgroup



## sizes table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| name               | string      | null: false                    |
| size_type_id       | integer     | null: false, foreign_key: true |

### Association
+ has_many :items

+ belongs_to :size_type



## size_types table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| size_type          | string      | null: false                    |

### Association
+ belongs_to :size



## transactions table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| user_id            | integer     | null: false, foreign_key: true |
| item_id            | integer     | null: false, foreign_key: true |

### Association
+ has_many :todos
+ has_many :transaction_messages
+ has_many :notifications

+ belongs_to :user
+ belongs_to :item



## transaction_messages table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| message            | text        | null: false                    |
| transaction_id     | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :transaction



## todos table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| todo               | string      | null: false, default: ""       |
| transaction_id     | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :transaction



## notifications table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| notification       | string      | null: false, default: ""       |
| transaction_id     | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :transaction



## creditcards table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| card_number        | integer     | null: false                    |

### Association
+ belongs_to :user
