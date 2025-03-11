function addNewForm() {
  // 新しい入力フォーム要素を作成
  var newForm = document.createElement('div');
  newForm.classList.add('row', 'justify-content-center');

  // 中身のフォーム要素を追加
  newForm.innerHTML = `
    <div class="col-md-2 mt-2">
      <h4>材料</h4>
    </div>
    <div class="col-md-2 mt-2">
      <input type="text" name="servings" class="form-control" placeholder="何人前">
    </div>
    <div class="col-md-3 mt-2">
      <input type="text" name="ingredient" class="form-control" placeholder="材料名">
    </div>
    <div class="col-md-3 mt-2">
      <input type="text" name="quantity" class="form-control" placeholder="分量">
    </div>
  `;

  // 作成した要素を既存の要素に挿入
  document.getElementById('form-container').appendChild(newForm);
}

// ボタンをセレクトしてクリックした時にaddNewForm関数を呼び出す
document.getElementById('add-button').addEventListener('click', addNewForm);