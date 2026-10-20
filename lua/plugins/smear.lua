return {
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    cond = not vim.g.neovide, -- disable in Neovide; use neovide_cursor_vfx_mode instead
    opts = {
      -- ====== Fire Cursor ====
      -- cursor_color = "#ff4000",
      -- particles_enabled = true,
      -- stiffness = 0.5,
      -- trailing_stiffness = 0.2,
      -- trailing_exponent = 5,
      -- damping = 0.6,
      -- gradient_exponent = 0,
      -- gamma = 1,
      -- never_draw_over_target = true, -- if you want to actually see under the cursor
      -- hide_target_hack = true, -- same
      -- particle_spread = 1,
      -- particles_per_second = 500,
      -- particles_per_length = 50,
      -- particle_max_lifetime = 800,
      -- particle_max_initial_velocity = 20,
      -- particle_velocity_from_cursor = 0.5,
      -- particle_damping = 0.15,
      -- particle_gravity = -50,
      -- min_distance_emit_particles = 0,

      -- ===== Smooth Smear Cursor ====

      -- stiffness = 0.5,
      -- trailing_stiffness = 0.5,
      -- matrix_pixel_threshold = 0.5,

      -- ==== Faster smooth smear cursor ====
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
    },
  },
}
