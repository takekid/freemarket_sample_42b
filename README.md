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
+ has_many :transaction_messages, thorough: items
+ has_many :todos, thorough: items
+ has_many :notifications, thorough: items



## addresses table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
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
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## likes table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## comments table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
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
| top_category_id    | integer     | null: false, foreign_key: true |
| middle_category_id | integer     | null: false, foreign_key: true |
| bottom_category_id | integer     | null: false, foreign_key: true |
| condition          | text        | null: false                    |
| size_id            | integer     | null: false, foreign_key: true |
| brand_id           | integer     | null: false, foreign_key: true |
| shippingfee        | string      | null: false                    |
| ship_from          | string      | null: false                    |
| shipping_date      | string      | null: false                    |
| price              | integer     | null: false                    |
| user_id            | integer     | null: false, foreign_key: true |
| buyer_id           | integer     | null: false, foreign_key: true |
| seller_id          | integer     | null: false, foreign_key: true |

### Association
+ has_many :reviews, through: users
+ has_many :likes, through: users
+ has_many :comments, thorough: users
+ has_many :item_images
+ has_many :notifications, thorough: users
+ has_many :todos, thorough: users
+ has_many :sizes
+ has_many :transaction_messages, thorough: users

+ belongs_to :top_category
+ belongs_to :middle_category
+ belongs_to :bottom_category
+ belongs_to :size
+ belongs_to :brand



## item_images table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| image            | text        | null: false, default: ""       |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :item



## top_categories table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| name             | string      | null: false                    |

### Association
+ has_many :items
+ has_many :middle_categories



## middle_categories table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| name             | string      | null: false                    |
| top_category_id  | integer     | null: false, foreign_key: true |
| size_type_id     | integer     | null: false, foreign_key: true |

### Association
+ has_many :items
+ has_many :bottom_categories

+ belongs_to :top_category
+ belongs_to :size-type



## bottom_categories table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| name               | string      | null: false                    |
| middle_category_id | integer     | null: false, foreign_key: true |

### Association
+ has_many :items

+ belongs_to :middle_category



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
+ belongs_to :middle_category



## transaction_messages table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| message            | text        | null: false                    |
| user_id            | integer     | null: false, foreign_key: true |
| item_id            | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## todos table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| todo               | string      | null: false, default: ""       |
| user_id            | integer     | null: false, foreign_key: true |
| item_id            | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## notifications table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| notification       | string      | null: false, default: ""       |
| user_id            | integer     | null: false, foreign_key: true |
| item_id            | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :item



## creditcards table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| card_number        | integer     | null: false                    |

