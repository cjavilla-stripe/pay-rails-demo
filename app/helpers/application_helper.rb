module ApplicationHelper
  def top_menu_items
    [{
      name: 'Payment Methods',
      path: payment_methods_path,
    }, {
      name: 'One-time payments',
      path: products_path,
    }, {
      name: 'Recurring payments',
      path: '/pricing',
    }, {
      name: 'Customer portal',
      path: '/subscription',
    }]
  end
end
