import { Injectable } from '@angular/core';
import { Observable, map, of } from 'rxjs';
import { Country } from '../common/country';
import { HttpClient } from '@angular/common/http';
import { State } from '../common/state';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class Luv2ShopFormService {

  private baseUrl = environment.luv2shopApiUrl;

  constructor(private httpClient: HttpClient) { }

  getCreditCardMonths(startMonth : number) : Observable<number[]>{
    let data : number[] =[];

    for(let theMonth = startMonth; theMonth<=12;theMonth++){
      data.push(theMonth);
    }

    return of(data);
  }

  getCreditCardYears() : Observable<number[]>{
    let data : number[] =[];

    const startYear : number = new Date().getFullYear();
    const endYear : number = startYear+10;

    for(let theYear=startYear;theYear<=endYear;theYear++){
      data.push(theYear);
    }

    return of(data);

  }

  getCountries() : Observable<Country[]>{
    const searchUrl = `${this.baseUrl}/countries`;

    return this.httpClient.get<GetResponseCountry>(searchUrl).pipe(
      map( response => response._embedded.countries )
    );
  }

  getStates (code : string) : Observable<State[]>{
    const searchUrl = `${this.baseUrl}/states/search/findByCountryCode?code=${code}`;

    return this.httpClient.get<GetResponseState>(searchUrl).pipe(
      map( response => response._embedded.states )
    );
  }

}

interface GetResponseCountry{
  _embedded : {
    countries: Country[];
  }
}

interface GetResponseState{
  _embedded : {
    states: State[];
  }
}

