import { LocalStorage } from 'quasar'
export default function () {
  return {
    status: '',
    token: LocalStorage.getItem('token') || '',
    user: {}
  }
}
