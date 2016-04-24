%funkcja tworzaca symetryczne macierze o wymiarze n
function [A] = cmsim (n)

  B = rand(n); 
  A = B'+B; %A-macierz symetryczna

end
