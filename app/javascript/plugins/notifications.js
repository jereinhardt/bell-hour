class Notifications {
  constructor(){
    this.notifications = $("[data-behavior='notifications']");
    if (this.notifications.length > 0) {
      this.setup();
    }
  }

  setup() {
    document.querySelector("[data-behavior='notifications-link']").addEventListener('click', this.handleClick);
    return $.ajax({
      url: "/api/v1/notifications",
      dataType: "JSON",
      method: "GET",
      success: this.handleSuccess
    })
  }

  handleClick(event) {
    return $.ajax({
      url: "/api/v1/notifications/mark_as_read",
      dataType: "JSON",
      method: "POST",
      success: function() {
        return "[data-behavior='notifications-link']".text(0);
      }
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
