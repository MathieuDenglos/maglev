clear all
close all

file = input('quel fichier ouvrir ?', 's');
data = csvread(file);
final = data;
dim_data = size(data);
figure(1);

while(file ~= "" && (dim_data(1) ~= 0 && dim_data(2) ~=0))
    
    for i = 1:1:dim_data(2)/2
        plot(data(:,2*i-1), data(:,2*i));
        hold on
    end
    file = input('Ajouter un autre fichier ? (sinon laisser vide)', 's');
    if(file ~= "")
        data = csvread(file);
        dim_data = size(data);
    
        if(dim_data(1) ~= 0 || dim_data(2) ~=0)
            dim_final = size(final);
            if(dim_final(1) > dim_data(1))
                data = [kron(ones(dim_final(1) - dim_data(1), 1), data(1,:));data];
            elseif(dim_final(1) < dim_data(1))
                final = [kron(ones(dim_data(1) - dim_final(1), 1), final(1,:));final];     
            end
            final = [final data];
        end
    end
end

%Rajouter les différentes caractéristiques spécifiques au graphe

file = input('Dans quel fichier enregistrer le tout', 's');
csvwrite(file, final);