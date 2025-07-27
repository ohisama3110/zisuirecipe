// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

<script>
  document.addEventListener('DOMContentLoaded', () => {
    // 材料追加
    const ingredientArea = document.querySelector('.ingredient-area');
    const addIngredientBtn = document.getElementById('add-ingredient-btn');

    addIngredientBtn.addEventListener('click', () => {
      const index = ingredientArea.querySelectorAll('.ingredient-group').length;

      const html = `
        <div class="mb-3 ingredient-group">
          <div class="row g-2">
            <div class="col">
              <input type="text" name="recipe[ingredients_attributes][${index}][ingredient]" placeholder="材料" class="form-control">
            </div>
            <div class="col">
              <input type="text" name="recipe[ingredients_attributes][${index}][quantity]" placeholder="分量" class="form-control">
            </div>
          </div>
          <input type="hidden" name="recipe[ingredients_attributes][${index}][_destroy]" value="false">
          <button type="button" class="btn btn-danger btn-sm mt-2 remove-ingredient-btn">削除</button>
        </div>
      `;

      ingredientArea.insertAdjacentHTML('beforeend', html);
    });

    // 手順追加
    const stepArea = document.querySelector('.step-area');
    const addStepBtn = document.getElementById('add-step-btn');

    addStepBtn.addEventListener('click', () => {
      const index = stepArea.querySelectorAll('.step-group').length;

      const html = `
        <div class="mb-4 step-group">
          <textarea name="recipe[steps_attributes][${index}][process]" placeholder="手順" class="form-control"></textarea>
          <input type="file" name="recipe[steps_attributes][${index}][step_image]" accept="image/*" class="form-control mt-2">
          <input type="hidden" name="recipe[steps_attributes][${index}][_destroy]" value="false">
          <button type="button" class="btn btn-danger btn-sm mt-2 remove-step-btn">削除</button>
        </div>
      `;

      stepArea.insertAdjacentHTML('beforeend', html);
    });

    // 削除ボタン機能
    document.body.addEventListener('click', (e) => {
      if (e.target.classList.contains('remove-ingredient-btn') || e.target.classList.contains('remove-step-btn')) {
        const group = e.target.closest('.ingredient-group, .step-group');
        group.querySelector('input[type="hidden"][name*="_destroy"]').value = '1';
        group.style.display = 'none';
      }
    });
  });
</script>
