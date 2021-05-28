

const form = document.querySelector('.new_booking');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // <-- to prevent <form>'s native behaviour
  const input = event.currentTarget.querySelector('.form-control');
  results.innerHTML = '';
  searchMovies(input.value);
});

