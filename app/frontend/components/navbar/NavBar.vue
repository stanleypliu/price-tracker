<template>
  <header>
    <nav class="navbar" :class="{ scrolled: hasScrolled.value === true }">
      <div class="nav-wrapper container">
        <a href="/" class="logo-text">Home</a>
        <ul id="nav-mobile" class="navbar__links">
          <li>
            <a href="/sites" class="navbar__link" data-text="Sites">Sites</a>
          </li>
          <li>
            <a href="/products" class="navbar__link" data-text="Products"
              >Products</a
            >
          </li>
          <li><a href="" class="btn">Log In</a></li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
import { scrolledDistance } from '@/composables/useScroll'

export default {
  setup() {
    const { hasScrolled, checkScroll, unlistenForScroll, listenForScroll } = scrolledDistance()

    return {
      hasScrolled,
      checkScroll,
      unlistenForScroll,
      listenForScroll
    }
  }
}
</script>

<style lang="scss" scoped>
header {
  position: fixed;
  top: 0;

  width: 100%;

  z-index: 2;
}

.logo-text {
  color: $green;
  font-size: 20px;
  font-weight: bold;
}

.nav-wrapper {
  display: flex;
  justify-content: space-between;
}

.navbar {
  background-color: transparent;
  box-shadow: none;

  &__links {
    max-width: 50%;
    display: flex;
  }

  &__link {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    color: $green;
    font-size: 20px;
    transition: font-weight 0.2s ease-in;

    &:hover {
      background-color: transparent;
      font-weight: bold;
    }

    // Stops layout from shifting upon hover
    &::after {
      content: attr(data-text) / "";
      height: 0;
      visibility: hidden;
      overflow: hidden;
      user-select: none;
      pointer-events: none;
      font-weight: bold;

      @media speech {
        display: none;
      }
    }
  }
}
</style>