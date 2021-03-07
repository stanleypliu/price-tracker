import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  plugins: [
    RubyPlugin(), vue()
  ],
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@import "@/stylesheets/base/variables";`
      }
    }
  }
})
