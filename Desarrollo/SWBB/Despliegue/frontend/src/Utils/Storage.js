export const Storage = {
  SetToken: (token) => {
    localStorage.setItem('token', token);
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
