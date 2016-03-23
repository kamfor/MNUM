# Projekt 1
##Epsilon maszynowy
1. Proszę napisać program wyznaczjący dokładność maszynową komputera i wyznaczyć ją na swoim komputerze. 


Epsilon maszynowy jest to maksymalny błąd względny reprezentacji zmiennoprzecinkowej. Zależy on jedynie od liczby bitów mantysy i nazywany jest dokładnością maszynową. Aby go wyznaczyć należy znajeźć najmniejszą nieujemną liczbę która dodada do jedności daje wynik różny od jedności. 

Epsilon maszynowy możemy wyznaczyć przy pomocy następującego algorytmu podanego jako lista kroków: 
1. a = 1, b = 2
2. dopóki a różne od 1 eps = x/2 b = 1 + x
3. wyświetl eps

Poniżej realizacja algorytmu w programie matlab: 

```MatLab
function[eps] = dok_maszynowa()
  a=1.0; 
  b=2.0; 
  
  while( b != 1)
      eps=a; 
      a=a/2; 
      b=1.0+a; 
  end
end
```
