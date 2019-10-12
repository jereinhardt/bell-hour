class Notifications {
  constructor(){
    this.notifications = $("[data-behavior='notifications']");
    if (this.notifications.length > 0) {
      this.setup();
    }
  }

  setup() {
    this.pollForUpdates();
    $("[data-behavior='notifications-link']").on("click", this.getNotificationsAndMarkAsRead);
  }

  setPollingTimeout() {
    this.poll = setTimeout(() => { this.pollForUpdates() }, 5000)
  }

  pollForUpdates() {
    this.getNotificationsCount().done(() => this.setPollingTimeout())
  }


  getNotificationsCount() {
    return $.get("/notifications.js")
  }

  getNotificationsAndMarkAsRead(event) {
    const url = event.currentTarget.dataset.remoteUrl;
    $.ajax({
      url: url,
      method: "PUT",
      data: { authenticity_token: $('meta[name="csrf-token"]').attr("content") }
    });
  }
}

jQuery(function() {
  return new Notifications;
});

export default Notifications;
