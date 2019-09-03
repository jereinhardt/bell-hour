class Notifications {
  constructor(){
    this.notifications = $("[data-behavior='notifications']");
    if (this.notifications.length > 0) {
      this.setup();
    }
  }

  setup() {
    return $.ajax({
      url: "/api/v1/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: this.handleSuccess
    })
  }

  handleSuccess(data) {
    const notificationDropdown = document.getElementById('notification-dropdown');
    data.forEach((notification) => {
      const dropDownNotification = `<a class="dropdown-item" href="/students/${notification.notifiable.id}">${notification.faculty} ${notification.action} ${notification.notifiable.type}</a>`;
      notificationDropdown.insertAdjacentHTML('beforeend', dropDownNotification);
    })
    $("[data-behavior='unread-count']").text(data.length)
  }
}

jQuery(function() {
  return new Notifications;
});

export default Notifications;
