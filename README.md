# DB設計

## users table
| column       | type        | options                                 |
|:-------------|------------:|:---------------------------------------:|
| name         | string      | null: false                             |
| kana_name    | string      | null: false                             |
| nickname     | string      | index: true, null: false, unique: true  |
| avater       | text        | null: false, default ""                 |
| phonenumber  | string      | null: false, unique: true               |


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
| good_count       | integer     | null: false, default 0         |
| normal_count     | integer     | null: false, default 0         |
| bad_count        | integer     | null: false, default 0         |
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
| category_id        | integer     | null: false, foreign_key: true |
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
+ has_many :categories

+ belongs_to :size
+ belongs_to :brand



## item_images table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| image            | text        | null: false, default: ""       |
| item_id          | integer     | null: false, foreign_key: true |

### Association
+ belongs_to :item



## categories table
| column            | type        | options                        |
|:----------------- |------------:|:------------------------------:|
| category_name     | string      | null: false                    |
| parent_id         | integer     | null: false, foreign_key: true |

+ has_many :items
+ has_many :categories

+ belongs_to :category



## brands table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| name               | string      | null: false                    |

### Association
+ has_many :brand_groups



## brand_groups table
| column             | type        | options                        |
|:------------------ |------------:|:------------------------------:|
| brand_id           | integer     | null: false, foreign_key: true |

### Association
+ has_many :items

+ belongs_to :brand



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
| column       | type        | options                        |
|:------------ |------------:|:------------------------------:|
| proceed      | integer     | null: false, default 0         |
| point        | integer     | null: false, default 0         |
| user_id      | integer     | null: false, foreign_key: true |
| item_id      | integer     | null: false, foreign_key: true |


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
| token_id           | integer     | null: false                    |

### Association
+ belongs_to :user
