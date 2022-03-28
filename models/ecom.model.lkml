connection: "thelook"

include: "/views/**/*.view"
include: "/access_grants.lkml"

datagroup: default_datagroup {
  max_cache_age: "24 hours"
}

persist_with: default_datagroup


explore: events {
  hidden: yes
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# explore: inventory_items {
#   hidden: yes
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }

#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_items {
#   hidden: yes
#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
#     relationship: many_to_one
#   }

#   join: users {
#     type: left_outer
#     sql_on: ${order_items.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }

#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }

#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }

explore: products {
  hidden: yes
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  hidden: yes
}
