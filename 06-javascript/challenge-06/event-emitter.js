function createEventEmitter() {
  return {
    events: {},

    on(eventName, handler) {
      if (!this.events[eventName]) {
        this.events[eventName] = [];
      }
      this.events[eventName].push(handler);

      return () => {
        this.events[eventName] = this.events[eventName].filter(
          fn => fn !== handler
        );
      };
    },

    once(eventName, handler) {
      const wrapper = (...args) => {
        handler(...args);
        this.offHandler(eventName, wrapper);
      };
      this.on(eventName, wrapper);
    },

    offHandler(eventName, handler) {
      if (!this.events[eventName]) return;
      this.events[eventName] = this.events[eventName].filter(
        fn => fn !== handler
      );
    },

    off(eventName) {
      this.events[eventName] = [];
    },

    emit(eventName, ...args) {
      if (!this.events[eventName]) return;
      this.events[eventName].forEach(fn => fn(...args));
    }
  };
}