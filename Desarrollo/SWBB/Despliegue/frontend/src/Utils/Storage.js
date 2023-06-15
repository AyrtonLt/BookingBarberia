export const Storage = {
  SetToken: (token) => {
    localStorage.setItem('token', token);
  },
  SetCustomer: (customer) => {
    localStorage.setItem("customer", JSON.stringify(customer));
  },
  GetCustomer: () => {
    const customer = localStorage.getItem("customer");
    return customer ? JSON.parse(customer) : null;
  },
  GetItem: (itemName) => {
    return JSON.parse(localStorage.getItem(itemName));
  },
  SetItem: (itemName, data) => {
    localStorage.setItem(itemName, JSON.stringify(data));
  },
  RemoveItem: (itemName) => {
    localStorage.removeItem(itemName);
  },
};
